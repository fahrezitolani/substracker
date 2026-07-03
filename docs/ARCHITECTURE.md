# Project Architecture

## Overview

Substracker is developed using a layered architecture to separate application responsibilities and improve maintainability.

---

## Folder Structure

```
lib/
├── core/
├── data/
├── features/
```

---

## Architecture Layers

### Core

Contains reusable components used throughout the application.

Contents:

- Theme
- Routes
- Providers
- Widgets
- Constants

---

### Data

Responsible for data management.

Contains:

- Models
- SQLite Database
- Repository

---

### Features

Contains all application screens grouped by feature.

Examples:

- Authentication
- Home Dashboard
- Subscription Management

---

## Design Pattern

The application follows a simple layered architecture using:

- Provider for state management
- SQLite for local storage
- Material Design 3 for user interface

---

## Advantages

- Easy maintenance
- Better code organization
- Scalable structure
- Reusable components