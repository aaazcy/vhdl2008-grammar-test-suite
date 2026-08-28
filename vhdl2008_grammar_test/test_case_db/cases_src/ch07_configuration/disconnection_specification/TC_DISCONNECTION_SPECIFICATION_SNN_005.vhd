-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SNN_005
-- Rule Type: Syntax (Negative)
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Negative
-- Test Focus: Missing the "disconnect" keyword - the declarative region directly contains "s_g : bit after 5 ns;" without the disconnect prefix, expecting the parser to report a syntax error at the identifier position
-- Expected Result: Triggers syntax error (missing required keyword "disconnect")
-- Dependencies: None
-- =============================================================
entity dcspec_no_disconnect_kw is
  port(a : in bit; y : out bit);
end entity;

architecture rtl of dcspec_no_disconnect_kw is
  signal s_g : bit register;
  -- ERROR: missing "disconnect" keyword, starts with signal name
  s_g : bit after 5 ns;
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a; y <= s_g;
  end block;
end architecture rtl;
