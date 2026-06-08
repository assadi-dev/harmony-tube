# Architecture Harmony Tube

## Convention cible : `modules/` (feature-first)

Toute fonctionnalité nouvelle ou refondue doit vivre dans `lib/modules/<feature>/` avec la structure suivante :

```
lib/modules/<feature>/
├── bloc/             # BLoCs et Cubits propres à la feature
├── model/            # Modèles spécifiques à la feature (Freezed)
├── services/         # Services UI/handlers spécifiques (pas les services métier)
├── widget/           # Widgets et sections de la feature
└── screen.dart       # Écran principal de la feature
```

Les briques **transversales** (consommées par plusieurs features) restent dans :

- `lib/core/` — modèles métier, repositories, usecases, errors, services techniques (logger, auth)
- `lib/cubit/` — Cubits transversaux (thème, sélection multiple, auth)
- `lib/bloc/` — BLoCs transversaux qui ne tiennent pas dans une feature unique (playlist, playlist_tracks, track)
- `lib/widgets/` — widgets vraiment réutilisables (cards, modals, forms)
- `lib/themes/`, `lib/config/`, `lib/routes/`, `lib/injections/`

## État actuel : double convention coexistante

Le dossier `lib/screens/` est **legacy**. Il regroupe d'anciens écrans qui n'ont pas encore été migrés dans `modules/`.

| Fichier legacy | Cible (module) |
|---|---|
| `lib/screens/home_screen.dart` + `lib/screens/home/` | `lib/modules/home/` |
| `lib/screens/playlist_screen.dart` + `lib/screens/playlist_screens/` | nouveau `lib/modules/playlists/` (à recréer) |
| `lib/screens/PlaylistDetailScreen.dart` + `lib/screens/playlist_details/` | `lib/modules/playlist_detail/` |
| `lib/screens/downloads_screen.dart` | nouveau `lib/modules/downloads/` |
| `lib/screens/settings_screens.dart` | `lib/modules/settings/` |

## Plan de migration (à faire ultérieurement)

La migration n'a pas été réalisée volontairement durant la refacto (Phases 1 à 4) parce qu'elle :

- impacte le routeur GoRouter (`lib/routes/router_base_config.dart`)
- impacte tous les `import 'package:harmony_tube/screens/...'` du code consommateur
- ne corrige aucun bug fonctionnel et risque de masquer des régressions sous des renommages massifs

Lorsque la migration sera effectuée, suivre cette procédure pour chaque écran :

1. Créer le dossier cible `lib/modules/<feature>/`.
2. Déplacer `screen.dart` + ses sous-widgets dans le module.
3. Mettre à jour tous les imports (`Find in files` puis remplacement).
4. Mettre à jour les routes dans `lib/routes/router_base_config.dart`.
5. Lancer `flutter analyze` et l'app pour vérifier qu'aucun écran n'est cassé.
6. Commit séparé par feature pour faciliter le revert si besoin.

## Règle de décision pour le nouveau code

- **Une feature isolée** (1-3 écrans, état propre) → `modules/<feature>/`.
- **Un widget générique** réutilisé par 3+ features → `lib/widgets/`.
- **Un service métier** (data, network, auth) → `lib/core/services/` ou `lib/core/data/`.
- **Un repository / usecase** → `lib/core/models/` (à terme, à renommer en `lib/core/domain/`).

## Couches actuelles

```
┌─────────────────────────────────────────┐
│ Presentation (widgets, screens, modals) │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│ BLoCs / Cubits (state management)       │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│ Usecases (orchestration métier)         │
│ → retournent Result<T, Failure>         │
└─────────────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────┐
│ Repositories (interfaces)               │
│ + InMemory impls (à remplacer par Hive  │
│   ou SQLite plus tard)                  │
└─────────────────────────────────────────┘
```

L'injection est centralisée dans `lib/injections/` et orchestrée par ordre `services → repositories → usecases → blocs`.
