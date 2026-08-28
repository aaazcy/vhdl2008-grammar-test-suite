-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SNN_002
-- Rule Type: Syntax (Negative)
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Negative
-- Test Focus: Missing "after" keyword — "disconnect s_g : bit 5 ns;" omits the required "after" between guarded_signal_specification and time_expression
-- Expected Result: Triggers syntax error (missing "after" keyword)
-- Dependencies: None
-- =============================================================
entity dcspec_no_after is
  port(a : in bit; y : out bit);
end entity;

architecture bh of dcspec_no_after is
  signal s_g : bit register;
  -- ERROR: missing "after" keyword
  disconnect s_g : bit 5 ns;
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a; y <= s_g;
  end block;
end architecture bh;
