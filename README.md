# Blogflutter

A new Flutter project.

# Application Architecture

This is the architecture of the application, showcasing the call flow between different layers and components. The architecture follows the principles of clean architecture, ensuring separation of concerns and maintaining a scalable structure.


```text
  Presentation 
      ↓
  Widgets 
      ↓
  Presentation Logic Holder : ChangeNotifier
      ↓
  Use Cases
      ↓
  Entities
      ↓
  Repositories
    ↙        ↘
Models     Models
    ↖        ↗
Remote Data Source    Local Data Source
      ↖                ↗
       Raw Data     Raw Data
          ↖         ↗
          API    Database


## S.O.L.I.D Principles & Clean Architecture Diagram

The following diagram represents the architecture of the application, illustrating how different components interact with each other following S.O.L.I.D principles:

```text
S.O.L.I.D principles & Clean architecture

  Presentation
      ├── BlocProvider
      |    ├── ItemBloc / ItemProvider
      |    ├── UserBloc / UserProvider
      ├── Pages
      ├── Themes
      ├── Routes
      └── Components
      ↓
  Domain
      ├── Repositories
      |    ├── IUserRepository (Interface Segregation)
      |    └── IItemRepository (Interface Segregation)
      ├── Entities
      |    ├── User (Liskov Substitution)
      |    └── Item (Liskov Substitution)
      └── Use Cases
          ├── find_user_by_id.dart (Open/Close, Single-responsibility)
          └── find_items.dart (Open/Close, Single-responsibility)
      ↓
  Data
      ├── Models
      |    ├── UserModel
      |    └── ItemModel
      ├── Sources
      |    ├── api_source
      |    ├── local_source
      |    └── firestore_source
      └── Repositories
  Core
      ├── Utils
      ├── Extensions
      ├── Generics
      ├── Services
      └── Errors
