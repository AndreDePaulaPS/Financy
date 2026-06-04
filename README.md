# 💸 Financy App

Um aplicativo financeiro premium desenvolvido em Flutter com foco em arquitetura profissional, experiência do usuário e boas práticas utilizadas em empresas reais.

O projeto foi criado com objetivo de servir como portfólio profissional, demonstrando organização, escalabilidade e construção incremental de produto.

---

## ✨ Preview

Financy é inspirado em aplicativos fintech modernos com:

* Dashboard premium
* Cartões financeiros
* Analytics e gráficos
* Histórico de transações
* Sessão persistente
* Componentização forte
* Arquitetura escalável

---

## 🚀 Objetivos do Projeto

Este projeto busca demonstrar:

* Clean Architecture (adaptada)
* MVVM
* Dependency Injection
* Result Pattern
* Command Pattern
* Session Management
* Testes
* Componentização
* UI Premium
* Integração com APIs

---

## 🏗️ Arquitetura

Fluxo principal:

```text
View
 ↓
ViewModel
 ↓
Command
 ↓
UseCase
 ↓
Repository
 ↓
Service
 ↓
API
```

---

## 📂 Estrutura do Projeto

```text
lib/
│
├── core/
│   ├── di/
│   ├── network/
│   ├── router/
│   ├── session/
│   └── storage/
│
├── shared/
│   ├── command/
│   ├── exceptions/
│   ├── widgets/
│   ├── enums/
│   └── utils/
│
├── features/
│   ├── auth/
│   ├── dashboard/
│   ├── cards/
│   ├── transactions/
│   └── profile/
```

---

## 🧠 Padrões Utilizados

### MVVM

Separação entre interface e estado.

### Repository Pattern

Abstração de acesso a dados.

### Result Pattern

Padronização de sucesso e falha.

### Command Pattern

Controle de loading, sucesso e erro.

### Session Manager

Gerenciamento global de autenticação.

---

## 🔐 Sistema de Autenticação

O projeto possui:

* Login
* Persistência local
* Restauração automática de sessão
* Refresh token (planejado)
* SessionManager

---

## 🌐 API

Inicialmente o projeto utiliza:

* Fake APIs
* Mockoon
* DTOs
* Mappers

Futuramente:

* Kotlin + Spring Boot
* PostgreSQL
* JWT

---

## 📦 Tecnologias

* Flutter
* Provider
* GetIt
* Dio
* SharedPreferences
* Mockito
* Result Pattern
* Command Pattern

---

## 🎨 Design

Inspirado em fintechs modernas:

* Nubank
* Inter
* Revolut
* Fintech UI concepts

Características:

* Dark Mode
* Cards premium
* Layout moderno
* Micro interações
* Dashboard elegante

---

## 🛣️ Roadmap

### Foundation

* [ ] Arquitetura base
* [ ] DI
* [ ] Result Pattern
* [ ] Command Pattern
* [ ] SessionManager

### Auth

* [ ] Login
* [ ] Persistência
* [ ] Splash
* [ ] Logout

### Dashboard

* [ ] Cards
* [ ] Analytics
* [ ] Transações

### Experience

* [ ] Animações
* [ ] Charts
* [ ] Skeleton Loading

### Backend

* [ ] API Spring Boot
* [ ] JWT
* [ ] PostgreSQL

---

## 🎯 Objetivo Final

Construir um produto que demonstre:

* Arquitetura profissional
* Organização empresarial
* UX moderna
* Escalabilidade
* Conhecimento mobile e backend

---

## 💡 Filosofia

> Projetos fortes não nascem gigantes.
>
> Eles nascem consistentes.

---

Desenvolvido por Andre De Paula 🚀
