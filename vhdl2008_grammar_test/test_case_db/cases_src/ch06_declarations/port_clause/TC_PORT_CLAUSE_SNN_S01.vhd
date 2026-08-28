-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SNN_S01
-- Rule Type: Syntax
-- BNF Production: PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5
-- Test Focus: port_clause: missing semicolon between port declarations
-- Case Type: Negative (Production-Specific)
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity pc_e port(x:in integer y:out integer);  -- ERROR: missing ; between ports
end entity;
