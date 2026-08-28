-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SNN_003
-- Rule Type: Syntax (Negative)
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Negative
-- Test Focus: Missing colon in guarded_signal_specification — "disconnect s_g bit after 5 ns;" omits the ":" between guarded_signal_list and type_mark
-- Expected Result: Triggers syntax error (missing colon in guarded signal specification)
-- Dependencies: None
-- =============================================================
entity dcspec_no_colon is
  port(a : in bit; y : out bit);
end entity;

architecture bh of dcspec_no_colon is
  signal s_g : bit register;
  -- ERROR: missing ":" between signal list and type_mark
  disconnect s_g bit after 5 ns;
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a; y <= s_g;
  end block;
end architecture bh;
