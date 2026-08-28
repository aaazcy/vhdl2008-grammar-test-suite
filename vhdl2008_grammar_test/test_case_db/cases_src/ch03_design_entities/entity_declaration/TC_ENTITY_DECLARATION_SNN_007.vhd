-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SNN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Negative
-- Test Focus: SNN: Port missing ";" separator — `port(a:in bit b:out bit)`, semicolon missing between the two interface_signal_declarations, verifying multiple port declarations in a port_list must be separated by semicolons
-- Expected Result: Triggers syntax error: missing ";" in port list
-- Dependencies: None
-- =============================================================
entity bad_port_sep is
  port(a:in bit b:out bit);
end entity bad_port_sep;
