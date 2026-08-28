-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SEM_001
-- Related Rule ID: SEM_RESOLUTI_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Test Focus: Resolution function with wrong number of parameters.
--   A resolution function must accept exactly one parameter of an
--   unconstrained array of the element type. A function with zero
--   parameters is not a valid resolution function.
-- Expected Result: Compilation error: invalid resolution function signature
-- Dependencies: None
-- =============================================================
entity resolution_indication_wrong_params is
end entity resolution_indication_wrong_params;

architecture zero_param_res of resolution_indication_wrong_params is
  -- ERROR: resolution function must have exactly one parameter
  function bad_resolver return integer is
  begin return 0; end function;
  subtype t_bad is bad_resolver integer;
  signal s : t_bad;
begin
end architecture zero_param_res;
