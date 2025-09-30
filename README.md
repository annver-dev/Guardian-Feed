# 📱 Guardian News App

Приложение на Flutter для чтения новостей с [guardianapis.com](https://open-platform.theguardian.com/).  
Поддерживает избранное и поиск по статьям.  

![<img width="392" height="796" alt="image" src="https://github.com/user-attachments/assets/f3b49293-a671-4bcb-948b-ce2c509e0bc5" />
](screenshots/home.png)

---

## ✨ Функционал
- 📄 Лента новостей с карточками  
- 🔍 Поиск по статьям  
- ⭐ Добавление в избранное  
- 📑 Детальный экран статьи  
- 🌙 Поддержка тёмной/светлой темы  

---

## 🛠️ Стек технологий
- **Flutter**  
- **Drift**  
- **Dio** 
- **Retrofit**  
- **AutoRoute** 
- **MVVM** 

---

## 🏗️ Архитектура
Проект разделён на три слоя:  
- **Data** → API (Dio/Retrofit), база (Drift)  
- **Domain** → UseCases, сущности  
- **Presentation** → ViewModels, UI (Flutter widgets)  

---

## 🚀 Запуск
1. Клонировать репозиторий:
   ```bash
   git clone https://github.com/username/guardian-news-app.git
