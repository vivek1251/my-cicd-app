# 🚀 CI/CD Pipeline with AWS CodePipeline & Elastic Beanstalk

A fully automated CI/CD pipeline that deploys a Node.js application to AWS Elastic Beanstalk whenever code is pushed to GitHub.

## 🌐 Live Demo

[http://My-cicd-app-env.eba-tiarw2rj.us-east-1.elasticbeanstalk.com](http://My-cicd-app-env.eba-tiarw2rj.us-east-1.elasticbeanstalk.com)

---

## 🏗️ Architecture

```
GitHub (Source) → AWS CodePipeline → AWS CodeBuild → AWS Elastic Beanstalk
```

| Stage | Tool | Purpose |
|-------|------|---------|
| Source | GitHub | Stores source code, triggers pipeline on push |
| Build | AWS CodeBuild | Installs dependencies, runs tests, creates artifact |
| Deploy | AWS Elastic Beanstalk | Hosts and runs the Node.js application |

---

## 🛠️ Tech Stack

- **Runtime:** Node.js 24
- **Framework:** Express.js
- **CI/CD:** AWS CodePipeline
- **Build:** AWS CodeBuild
- **Deployment:** AWS Elastic Beanstalk
- **Cloud:** AWS (us-east-1)
- **Source Control:** GitHub

---

## 📁 Project Structure

```
my-cicd-app/
├── src/
│   └── index.js          # Main Express app
├── scripts/
│   ├── start.sh          # Start script
│   ├── stop.sh           # Stop script
│   └── install.sh        # Install script
├── buildspec.yml         # CodeBuild build instructions
├── appspec.yml           # CodeDeploy deployment instructions
├── Procfile              # Elastic Beanstalk process file
└── package.json          # Node.js dependencies
```

---

## ⚙️ AWS Services Used

- **AWS CodePipeline** — Orchestrates the CI/CD workflow
- **AWS CodeBuild** — Builds and tests the application
- **AWS Elastic Beanstalk** — Hosts the Node.js application
- **AWS S3** — Stores build artifacts
- **AWS IAM** — Manages permissions and roles

### IAM Roles Created

| Role | Purpose |
|------|---------|
| EC2CodeDeployRole | Allows EC2 instances to use CodeDeploy |
| CodeDeployServiceRole | Allows CodeDeploy to manage deployments |
| CodeBuildServiceRole | Allows CodeBuild to build projects |
| CodePipelineServiceRole | Allows CodePipeline to orchestrate stages |

---

## 🚀 How to Deploy

### Prerequisites

- AWS Account
- GitHub Account
- Node.js & npm installed
- Git installed

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/vivek1251/my-cicd-app.git
   cd my-cicd-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Run locally**
   ```bash
   node src/index.js
   ```
   Visit `http://localhost:8080`

### Triggering the Pipeline

Simply push code to the `main` branch:

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

The pipeline will automatically:
1. Pull the latest code from GitHub
2. Run `npm install` and `npm test` via CodeBuild
3. Deploy the new version to Elastic Beanstalk

---

## 📝 API Endpoints

| Method | Endpoint | Response |
|--------|----------|----------|
| GET | `/` | `Hello from CI/CD Pipeline! Version 1.0` |

---

## 🔧 Configuration Files

### buildspec.yml
Defines the build steps for AWS CodeBuild:
- Install Node.js dependencies
- Run tests
- Package artifacts

### Procfile
Tells Elastic Beanstalk how to start the application:
```
web: node src/index.js
```

---

## 📊 Pipeline Flow

```
┌─────────────────────────────────────────────────────┐
│                   Developer                          │
│           git push origin main                       │
└──────────────────────┬──────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────┐
│              AWS CodePipeline                        │
│                                                      │
│  ┌──────────┐    ┌──────────┐    ┌──────────────┐   │
│  │  Source  │───▶│  Build   │───▶│    Deploy    │   │
│  │  GitHub  │    │CodeBuild │    │Elastic Bean  │   │
│  └──────────┘    └──────────┘    └──────────────┘   │
└─────────────────────────────────────────────────────┘
                       │
                       ▼
┌─────────────────────────────────────────────────────┐
│           Live Application                           │
│   http://My-cicd-app-env.eba-tiarw2rj...com         │
└─────────────────────────────────────────────────────┘
```

---

## 👨‍💻 Author

**Vivek** — [GitHub](https://github.com/vivek1251)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
