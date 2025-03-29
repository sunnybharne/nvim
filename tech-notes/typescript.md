# TypeScript

## Overview
TypeScript is a strongly typed superset of JavaScript that enhances code quality and maintainability. This guide covers essential TypeScript concepts and best practices.

## Table of Contents
1. [Basic Types](#basic-types)
2. [Type Annotations](#type-annotations)
3. [Functions](#functions)
4. [Interfaces](#interfaces)
5. [Classes](#classes)
6. [Generics](#generics)
7. [Advanced Types](#advanced-types)
8. [Best Practices](#best-practices)

## Basic Types

### Primitive Types
```typescript
let isCompleted: boolean = false;
let decimal: number = 6;
let message: string = "Hello, TypeScript";
let list: number[] = [1, 2, 3];
let tuple: [string, number] = ["hello", 10];
let notSure: any = 4;
let nothing: void = undefined;
let never: never;
```

### Type Inference
TypeScript automatically infers types when possible:
```typescript
let x = 3; // TypeScript infers x as number
let arr = [1, 2, 3]; // TypeScript infers arr as number[]
```

## Type Annotations

### Function Parameters and Return Types
```typescript
function add(x: number, y: number): number {
    return x + y;
}

const multiply = (x: number, y: number): number => x * y;
```

### Optional and Default Parameters
```typescript
function buildName(firstName: string, lastName?: string): string {
    return lastName ? `${firstName} ${lastName}` : firstName;
}

function createUser(name: string, age: number = 18): User {
    return { name, age };
}
```

## Functions

### Function Types
```typescript
type MathFunction = (x: number, y: number) => number;
const add: MathFunction = (x, y) => x + y;
```

### Overloads
```typescript
function process(x: number): number;
function process(x: string): string;

function process(x: number | string): number | string {
    if (typeof x === "number") {
        return x * 2;
    }
    return x.toUpperCase();
}
```

## Interfaces

### Basic Interface
```typescript
interface User {
    id: number;
    name: string;
    email: string;
}

const user: User = {
    id: 1,
    name: "John Doe",
    email: "john@example.com"
};
```

### Optional Properties
```typescript
interface Config {
    required: string;
    optional?: number;
    readonly id: number;
}
```

### Function Interfaces
```typescript
interface SearchFunc {
    (source: string, subString: string): boolean;
}

const mySearch: SearchFunc = (source, subString) => {
    return source.search(subString) > -1;
};
```

## Classes

### Basic Class
```typescript
class Animal {
    private name: string;
    protected species: string;

    constructor(name: string, species: string) {
        this.name = name;
        this.species = species;
    }

    public move(distance: number = 0): void {
        console.log(`${this.name} moved ${distance}m.`);
    }
}
```

### Inheritance
```typescript
class Dog extends Animal {
    constructor(name: string) {
        super(name, "Canis");
    }

    bark(): void {
        console.log("Woof! Woof!");
    }
}
```

## Generics

### Generic Functions
```typescript
function identity<T>(arg: T): T {
    return arg;
}

const result = identity<string>("Hello");
const numberResult = identity<number>(42);
```

### Generic Interfaces
```typescript
interface GenericIdentityFn<T> {
    (arg: T): T;
}

const myIdentity: GenericIdentityFn<number> = identity;
```

## Advanced Types

### Union Types
```typescript
type StringOrNumber = string | number;
function process(value: StringOrNumber): void {
    if (typeof value === "string") {
        console.log(value.toUpperCase());
    } else {
        console.log(value.toFixed(2));
    }
}
```

### Intersection Types
```typescript
interface Employee {
    id: number;
    name: string;
}

interface ContactInfo {
    email: string;
    phone: string;
}

type EmployeeWithContact = Employee & ContactInfo;
```

### Type Guards
```typescript
function isString(value: any): value is string {
    return typeof value === "string";
}

function processValue(value: unknown): void {
    if (isString(value)) {
        console.log(value.toUpperCase());
    }
}
```

## Best Practices

### Code Organization
1. Use meaningful type names
2. Implement proper type annotations
3. Leverage TypeScript's type inference
4. Maintain consistent naming conventions

### Type Safety
1. Avoid using `any` type
2. Implement proper error handling
3. Use strict type checking
4. Leverage TypeScript's built-in types

### Performance
1. Minimize type complexity
2. Use appropriate type constraints
3. Implement efficient type guards
4. Optimize type declarations

## Resources
- [TypeScript Official Documentation](https://www.typescriptlang.org/docs/)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/handbook/basic-types.html)
- [TypeScript Playground](https://www.typescriptlang.org/play)
