-- =============================================================
-- Case ID: TC_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_conditional_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] conditional_waveforms ;
-- Case Type: Positive
-- Test Focus: multi-stage when-else chain — a 4-to-1 priority encoder: each when condition is evaluated in turn, verifying the priority semantics of a multi-branch conditional signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ccsa_priority_ent is
  port(req : in bit_vector(3 downto 0); grant : out bit_vector(3 downto 0));
end entity ccsa_priority_ent;
architecture bh of ccsa_priority_ent is
begin
  grant <= "0001" when req(0) = '1' else
           "0010" when req(1) = '1' else
           "0100" when req(2) = '1' else
           "1000" when req(3) = '1' else
           "0000";
end architecture bh;
