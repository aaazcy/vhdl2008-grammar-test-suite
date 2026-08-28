-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution | record_resolution
-- Case Type: Negative
-- Test Focus: Syntax error -- element resolution with missing
--            resolution function arguments. A resolution function
--            requires a specific parameter profile; calling it
--            without proper syntax causes a parse error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity elem_res_snn_bad_func_syntax is
end entity elem_res_snn_bad_func_syntax;
architecture rtl of elem_res_snn_bad_func_syntax is
  function resolve(x) return bit is begin return '0'; end;  -- ERROR: no type for parameter x
  subtype rbit is resolve bit;
  type t_arr is array (0 to 3) of rbit;
  signal s : t_arr;
begin
end architecture rtl;
