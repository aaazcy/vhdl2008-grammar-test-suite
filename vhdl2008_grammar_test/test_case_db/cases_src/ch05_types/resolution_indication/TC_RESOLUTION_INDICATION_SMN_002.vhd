-- =============================================================
-- Case ID: TC_RESOLUTION_INDICATION_SMN_002
-- Related Rule ID: SMN_RESOLUTI_002
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: resolution_indication ::= resolution_function_name | ( element_resolution )
-- Case Type: Negative
-- Test Focus: Static model negative -- resolution_indication uses a
--            non-function name as the resolution function. The name
--            must resolve to a function with the correct signature.
--            Using a constant or signal name is illegal.
-- Expected Result: Triggers not-a-function error
-- Dependencies: None
-- =============================================================
entity res_ind_smn_not_function is
  port ( dout : out integer );
end entity res_ind_smn_not_function;
architecture rtl of res_ind_smn_not_function is
  constant C_RESOLVE : integer := 0;
  subtype bad_resolved is C_RESOLVE integer;  -- ERROR: C_RESOLVE is not a function
  signal s : bad_resolved;
begin
  dout <= 0;
end architecture rtl;
