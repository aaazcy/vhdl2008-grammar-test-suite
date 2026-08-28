-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: With guarded——`y <= guarded a;` uses the guarded keyword inside a block, verifying that a concurrent assignment with the guarded modifier takes effect only when the guard condition is true
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity css_guarded_ent is
  port(clk, a : in bit; y : out bit);
end entity css_guarded_ent;
architecture bh of css_guarded_ent is
begin
  blk_g : block(clk = '1') is
  begin
    y <= guarded a;
  end block blk_g;
end architecture bh;
