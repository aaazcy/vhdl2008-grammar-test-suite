-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Rule Description: All possible values of the select expression must be covered; if a value is omitted and no "others" choice exists, a simulation error occurs when that value is selected
-- Case Type: Negative
-- Error Category: elaboration_error
-- Test Focus: SMN: select expression not fully covered and no others — the expression is bit_vector(1 downto 0) with 4 possible values, but only the two choices "00" and "01" are listed with no others, verifying the error of missing others when coverage is incomplete
-- Expected Result: Triggers elaboration error: not all choices covered in selected signal assignment
-- Dependencies: None
-- =============================================================
entity cssa_smn2_ent is
  port(a, b : in bit_vector(3 downto 0); op : in bit_vector(1 downto 0); y : out bit_vector(3 downto 0));
end entity cssa_smn2_ent;
architecture bh of cssa_smn2_ent is
begin
  with op select
    y <= a and b when "00",
         a or b  when "01";
end architecture bh;
