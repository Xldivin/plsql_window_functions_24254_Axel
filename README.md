# Inventory Analytics Using SQL JOINs and Window Functions (PostgreSQL)

## Business Problem

This project analyzes warehouse inventory operations to identify product movement trends, warehouse performance, and stock distribution efficiency. The objective is to support data-driven supply chain decisions.

# Database Schema

Tables:

- warehouses
- suppliers
- products
- stock_movements

# SQL JOIN Implementation

- INNER JOIN → Valid stock movements
- LEFT JOIN → Inactive warehouses
- RIGHT JOIN → Non-moving products
- FULL OUTER JOIN → Complete activity comparison
- SELF JOIN → Regional warehouse comparison

# Window Function Implementation


- RANK() → Top 5 products per warehouse
- SUM() OVER() → Running monthly totals
- LAG() → Month-over-month changes
- NTILE(4) → Product segmentation


# Key Insights

- Fast-moving products concentrated in specific warehouses.
- Some facilities underutilized.
- Movement trends fluctuate seasonally.

# References

- PostgreSQL Official Documentation
- SQL Window Functions Guide

# Integrity Statement

“All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.”