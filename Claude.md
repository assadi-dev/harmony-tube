# Brief Claude — Harmony Tube (yt-player)

Tu es un agent IA spécialisé en développement Flutter / Dart. Ce projet est une application mobile de lecteur musical YouTube (`harmony_tube`). À chaque démarrage de session, lis ce fichier avant de répondre.

## Contexte projet

- **App** : Harmony Tube — lecteur YouTube Music multiplateforme (Android prioritaire, iOS secondaire).
- **Branche actuelle** : `google-auth`.
- **État** : refacto architecturale en 4 phases déjà appliquée (DI complète, modèles freezed, gestion d'erreurs typée, tests unitaires). Voir `docs/ARCHITECTURE.md`.

## Stack technique

- Flutter 3.x / Dart SDK `^3.8.1`
- **State management** : `flutter_bloc 9.1.1` (BLoC + Cubit)
- **DI** : `get_it 8.0.3` (service locator, scindé en 4 couches)
- **Routing** : `go_router 15.1.3` (StatefulShellRoute)
- **Codegen** : `freezed 2.5.x` + `json_serializable 6.8.x` (lancer `flutter pub run build_runner build --delete-conflicting-outputs` après modification de modèle)
- **Audio** : `just_audio`, `audio_service`, `audio_session`
- **UI** : `wolt_modal_sheet`, `persistent_bottom_nav_bar_v2`, `google_nav_bar`, `flutter_carousel_widget`
- **Auth** : `google_sign_in 7.2.0`
- **Logging** : `logger 2.4.0` (singleton via DI → helper `appLogger`)
- **Tests** : `flutter_test` + `mocktail 1.0.4`

## Architecture en place — ne pas casser

### Couches (cf. `docs/ARCHITECTURE.md`)

```
Presentation (widgets, screens) → BLoCs/Cubits → Usecases → Repositories (InMemory)
```

### Règles non négociables

1. **Tous les Repositories et Usecases retournent `Result<T>`** (sealed class maison dans `lib/core/errors/result.dart`). Jamais `throw`, jamais `Exception(e)`.
2. **Toutes les erreurs sont typées** via la sealed class `Failure` (`lib/core/errors/failure.dart`) : `NetworkFailure`, `AuthFailure`, `CacheFailure`, `ValidationFailure`, `NotFoundFailure`, `UnknownFailure`. Pas de cast `e as Exception`.
3. **Les BLoCs/Cubits utilisent `Result.fold(onSuccess, onFailure)`** pour mapper en `state`.
4. **States immuables avec sentinel pattern** pour permettre `error: null` (reset) — voir n'importe quel `*_state.dart` pour le modèle.
5. **Aucun `print()`** dans `lib/` — utiliser `appLogger.d/i/w/e(message, error: e, stackTrace: st)`.
6. **Tous les modèles métier sont `@freezed`** (`TrackItemModel`, `PlaylistItemModel`, `YoutubeCategory`, etc.). Pas de modèles mutables.
7. **DI orchestrée par `lib/injections/injector.dart`** dans l'ordre `services → repositories → usecases → blocs`. Toujours respecter cet ordre.
8. **Convention de nommage Dart** : `lowerCamelCase` variables/méthodes, `UpperCamelCase` classes/types, `snake_case` noms de fichiers, `lowerCamelCase` constantes.
9. **Module first** : tout nouveau code va dans `lib/modules/<feature>/`. Le legacy `lib/screens/` ne reçoit plus de nouveau code.
10. **Tests obligatoires** pour tout nouveau BLoC/Cubit/Usecase/Repository — calque les patterns de `test/bloc/playlist/playlist_bloc_test.dart`.
11. **Tous les modals/bottom sheets/dialogs passent par `wolt_modal_sheet`** (`WoltModalSheet.show` avec `WoltModalType.bottomSheet()` ou `WoltModalType.dialog()`). Ne jamais utiliser `showModalBottomSheet`, `showDialog`, `showBottomSheet`, `showCupertinoModalPopup`, `showCupertinoDialog`. Exemples canoniques : `lib/widgets/cards/music_card.dart` (bottom sheet), `lib/widgets/modals/confirm_modal.dart` (dialog), `lib/widgets/cards/playlist_card.dart` (bottom sheet avec page composée).

## Skills à invoquer en priorité

Selon la tâche, invoque proactivement l'un des skills suivants :

- `dart-flutter-patterns` — pour pattern Dart/Flutter (null safety, async, immutabilité, BLoC, GoRouter, Freezed)
- `flutter-apply-architecture-best-practices` — pour structurer une nouvelle feature
- `flutter-fix-layout-issues` — RenderFlex overflow, contraintes unbounded
- `flutter-build-responsive-layout` — adaptation mobile/tablette
- `flutter-use-http-package` — uniquement quand une vraie API REST est ajoutée (actuellement repositories InMemory)
- `flutter-implement-json-serialization` — uniquement si on évite freezed (sinon utiliser le codegen)
- `flutter-setup-declarative-routing` — pour ajouter / modifier une route GoRouter
- `ui-ux-pro-max` — pour design d'écrans / composants visuels
- `verify` — pour valider qu'un fix fonctionne dans l'app réelle (pas juste les tests)
- `run` — pour lancer l'app et tester en interactif

## Règles de collaboration

- **Avant de coder une feature non triviale** : pose une à trois questions ciblées pour cadrer (utilise `AskUserQuestion`). Ne suppose pas l'intention.
- **Avant d'installer un package** : propose 2 alternatives avec leurs trade-offs (taille, maintenance, dépendances transitives), puis demande quel choix.
- **Avant de créer un nouveau widget** : vérifier qu'il n'existe pas déjà dans `lib/widgets/cards/`, `lib/widgets/modals/`, `lib/widgets/forms/`. Préférer la composition / l'extraction.
- **Avant de toucher à un modèle freezed** : prévenir qu'il faudra relancer `build_runner`.
- **Avant de toucher à un BLoC existant** : vérifier les tests dans `test/bloc/<feature>/` et les adapter dans le même PR.
- **Après un renommage d'identifiant exporté** (fonction, classe, constante publique) : faire un `grep` global de l'ancien nom dans `lib/` ET lancer `flutter analyze` à la racine (pas sur un seul fichier) avant de considérer la tâche terminée. `flutter analyze <file>` ne voit pas les call sites externes.
- **Ne jamais désactiver une règle de lint** sans justification explicite et accord de l'utilisateur.

## Commandes utiles

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
flutter run -d <deviceId>
```

## Fichiers de référence à consulter au besoin

- `docs/ARCHITECTURE.md` — règle de décision modules/legacy, schéma des couches, plan de migration.
- `lib/core/errors/failure.dart` et `result.dart` — fondations gestion d'erreurs.
- `lib/injections/` — orchestration DI complète.
- `lib/bloc/playlist/playlist_bloc.dart` — exemple canonique de BLoC qui consomme un Usecase.
- `test/bloc/playlist/playlist_bloc_test.dart` — exemple canonique de test BLoC avec mocktail.

## Ce qui reste ouvert (à proposer si pertinent)

- Migration `screens/` legacy → `modules/` (cf. `docs/ARCHITECTURE.md`).
- Remplacement de `InMemoryPlaylistRepository` par une vraie persistance (Hive ou SQLite).
- Intégration d'une vraie API YouTube Music dans `youtube_api_service.dart` (actuellement stub).
- Migration `withOpacity` → `withValues` (Flutter récent).
- Suite la migration de naming `bottom_bar_list_Items.dart`, `layout_scrollView.dart`, `AlertCard.dart`, `PlaylistDetailScreen.dart` vers `snake_case`.
- Couverture de tests pour `TrackBloc`, `CategoriesBloc`, et widgets clés.
