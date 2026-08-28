-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: conditional_signal_assignment ::= target <= [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: Conditional signal assignment full when-else chain + delay: a when-else chain with 4 branches (when a>b / when a<b / when a=b / else 0), target includes a delay_mechanism (inertial after 3ns), verifying the most complete form of conditional signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cond_sa_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of cond_sa_ent is
  signal s_res:integer:=0;
begin
  process(a,b) begin
    s_res<= 100 after 3 ns when a>b else
             50 after 3 ns when a<b else
             25 after 3 ns when a=b else 0;
  end process;
  y<=s_res;
end architecture bh;
