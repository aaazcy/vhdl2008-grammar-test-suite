-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Negative
-- Test Focus: SNN — missing semicolon separator between two
--   interface_element items in a port clause. The first interface_element
--   (signal port) is syntactically valid, but the missing ";" before
--   the second interface_element causes a parser error.
-- Expected Result: Triggers syntax error (missing semicolon)
-- Dependencies: None
-- =============================================================
entity iface_elem_no_semicolon_e is
  port (
    -- ERROR: missing semicolon between these two port interface elements
    signal clk   : in  bit
    signal reset : in  bit;
    signal dout  : out bit
  );
end entity iface_elem_no_semicolon_e;

architecture err of iface_elem_no_semicolon_e is
begin
  dout <= '0';
end architecture err;
