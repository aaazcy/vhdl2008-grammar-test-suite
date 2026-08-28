-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Case Type: Negative
-- Test Focus: Syntax error -- record element resolution with
--            resolution function call missing the actual parameter.
--            The resolution indication syntax requires either a
--            function name or parenthesized element_resolution.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity rec_elem_res_snn_bad_res is
end entity rec_elem_res_snn_bad_res;
architecture rtl of rec_elem_res_snn_bad_res is
  function resolve(v : bit_vector) return bit is begin return '0'; end;
  type t_rec is record
    val : resolve;  -- ERROR: missing type_mark after resolution function
  end record;
  signal s : t_rec;
begin
end architecture rtl;
