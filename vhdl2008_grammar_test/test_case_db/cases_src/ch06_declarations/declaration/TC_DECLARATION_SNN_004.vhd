-- =============================================================
-- Case ID: TC_DECLARATION_SNN_004
-- Rule Type: Syntax
-- BNF Production: DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration
--   | object_declaration | interface_declaration
--   | alias_declaration | attribute_declaration
--   | component_declaration | group_template_declaration
--   | group_declaration | entity_declaration
--   | configuration_declaration | subprogram_declaration
--   | package_declaration
-- Test Focus: Component declaration missing port clause closing
--   parenthesis — BNF requires component_declaration ::=
--   component identifier [ is ] [ local_generic_clause ]
--   [ local_port_clause ] end component [ simple_name ] ;
--   Port clause must have balanced parentheses
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity declaration_snn_004 is
  port (
    a_in  : in  bit;
    b_in  : in  bit;
    y_out : out bit
  );
end entity declaration_snn_004;

architecture rtl of declaration_snn_004 is
  -- ERROR: component declaration with missing closing parenthesis in port
  component and_gate is
    port (
      a : in  bit;
      b : in  bit;
      y : out bit
  end component;

  signal s_a, s_b, s_y : bit;
begin
  s_a <= a_in;
  s_b <= b_in;
  y_out <= s_y;
end architecture rtl;
