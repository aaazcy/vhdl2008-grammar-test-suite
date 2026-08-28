-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: Port missing ")" closure — `port(clk:in bit; data:in bit_vector(7 downto 0)`, the closing parenthesis of the port_clause is missing, verifying the port_list must terminate with a closing parenthesis — one of the most common entity syntax errors
-- Expected Result: Triggers syntax error: missing ")" in port clause
-- Dependencies: None
-- =============================================================
entity bad_port_close is
  port(clk:in bit; data:in bit_vector(7 downto 0);
end entity bad_port_close;
