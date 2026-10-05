# PGCP-MC Journey

Coursework and progress from the Post Graduate Certificate Programme in Mobile Computing (PGCP-MC) at Sunbeam Institute, a C-DAC ACTS training centre. This repository currently contains the coursework present in the supplied archive for Core Java, DBMS, and Hybrid/Web Development.

## Coursework

| Subject | Available days | Folder |
| --- | --- | --- |
| Core Java and OOP | 01�13 | [coursework/core-java](coursework/core-java/) |
| Database Management Systems | 01�08 | [coursework/dbms](coursework/dbms/) |
| Hybrid/Web Development | 01�14 | [coursework/hybrid-web](coursework/hybrid-web/) |

Each day keeps the original exercise and demo grouping where practical. Trainer PDFs, nested classroom Git repositories, IDE metadata, dependency lockfiles, and generated files are omitted. See [PROGRESS.md](PROGRESS.md) for the archive-based progress inventory.

## Running examples

Examples have their own dependencies and setup requirements. For Node.js demos, use the `package.json` in the relevant day/project directory. Configure database passwords and JWT secrets through environment variables such as `DB_PASSWORD` and `JWT_SECRET`; do not commit `.env` files or real credentials. Some browser exercises are standalone HTML files.

## Repository hygiene

`.env` files, dependencies, build outputs, IDE settings, and compiled artifacts should stay out of version control. Coursework examples are retained as learning exercises; they may need adaptation before production use.

## About

Faheem � studying PGCP-MC (Mobile Computing) at Sunbeam Institute.
GitHub: [@realfah3em](https://github.com/realfah3em)