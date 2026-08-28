-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: matching select with "?" — `with op select ?` uses the VHDL 2008 matching select syntax to support don't care matching, verifying that the "?" modifier makes a selected assignment support matching case semantics
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cssa_match_ent is
  port(a, b : in bit_vector(3 downto 0); op : in bit_vector(1 downto 0); y : out bit_vector(3 downto 0));
end entity cssa_match_ent;
architecture bh of cssa_match_ent is
begin
  with op select ?
    y <= a and b when "00",
         a or b  when "01",
         a xor b when "10",
         not a   when others;
end architecture bh;
