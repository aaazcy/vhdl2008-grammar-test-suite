-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SNN_S01
-- Rule Type: Syntax
-- BNF Production: ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Test Focus: entity_header: malformed generic clause
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity bad_eh generic WIDTH:integer  -- ERROR: missing parentheses
  port(x:out integer); end entity;
