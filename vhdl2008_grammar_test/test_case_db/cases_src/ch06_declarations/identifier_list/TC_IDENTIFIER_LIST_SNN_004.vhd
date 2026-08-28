-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Test Focus: SNN — trailing comma after the last identifier in the list.
--   The BNF specifies: identifier { , identifier }. The repetition
--   { , identifier } requires the comma to be followed by another
--   identifier. A trailing comma leaves the parser expecting another
--   identifier that never arrives, causing a syntax error.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (trailing comma)
-- Dependencies: None
-- =============================================================

-- ERROR: trailing comma after "port_c" in the port declaration.
-- The identifier_list must end with an identifier, not a comma.
-- "port_a, port_b, port_c," has a dangling comma with no following identifier.
entity id_list_snn4 is
  port (
    port_a, port_b, port_c, : in bit
  );
end entity id_list_snn4;

architecture rtl of id_list_snn4 is
begin
end architecture rtl;
