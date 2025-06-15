#!/bin/bash

# Script to initialize a Next.js project with TypeScript
set -euo pipefail

PROJECT="ecommerce-store-nextjs"

# Create project directory
mkdir -p "$PROJECT"
cd "$PROJECT"

# Initialize npm project
npm init -y

# Install dependencies
npm install react react-dom next

# Install dev dependencies for TypeScript
npm install -D typescript @types/react @types/node

# Create minimal Next.js directory structure
mkdir -p pages
cat <<'PAGE' > pages/index.tsx
export default function Home() {
  return <div>Hello Next.js!</div>;
}
PAGE

# Configure tsconfig.json
cat <<'JSON' > tsconfig.json
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "esnext"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "node",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx"],
  "exclude": ["node_modules"]
}
JSON

# Create next-env.d.ts
echo '/// <reference types="next" />' > next-env.d.ts
echo '/// <reference types="next/types/global" />' >> next-env.d.ts
echo '/// <reference types="next/image-types/global" />' >> next-env.d.ts

cat <<'NOTICE'
Project initialized. Run "npm run dev" inside "$PROJECT" to start Next.js.
NOTICE

