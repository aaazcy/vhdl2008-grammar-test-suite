-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RESOLUTION_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Case Type: Negative
-- Test Focus: Syntax error -- resolution indication with mismatched
--            parentheses in the element_resolution form. The opening
--            parenthesis has no matching close parenthesis.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity res_ind_snn_unmatched_paren is
end entity res_ind_snn_unmatched_paren;
architecture rtl of res_ind_snn_unmatched_paren is
  function rbit(v : bit_vector) return bit is begin return '0'; end;
  subtype bad_res is (rbit bit;  -- ERROR: missing closing ')'
  signal s : bad_res;
begin
end architecture rtl;
