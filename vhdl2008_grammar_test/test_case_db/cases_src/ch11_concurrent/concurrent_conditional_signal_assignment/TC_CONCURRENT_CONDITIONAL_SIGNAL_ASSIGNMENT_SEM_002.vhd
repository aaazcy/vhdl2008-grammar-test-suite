-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Rule Description: Conditional signal assignments have priority semantics — the first when condition that evaluates to true determines the assigned value; subsequent conditions are not evaluated even if also true
-- Case Type: Positive
-- Test Focus: priority encoding semantics — the req(0) condition comes first and has the highest priority, so even if req(1) is also '1', the grant assignment follows the first true when branch, verifying the priority rather than parallel semantics of a conditional assignment
-- Expected Result: Compiles successfully; req(0) has highest priority
-- Dependencies: None
-- =============================================================
entity ccsa_sem2_ent is
  port(req : in bit_vector(3 downto 0); grant : out bit_vector(1 downto 0));
end entity ccsa_sem2_ent;
architecture bh of ccsa_sem2_ent is
begin
  grant <= "00" when req(0) = '1' else
           "01" when req(1) = '1' else
           "10" when req(2) = '1' else
           "11" when req(3) = '1' else
           "00";
end architecture bh;
