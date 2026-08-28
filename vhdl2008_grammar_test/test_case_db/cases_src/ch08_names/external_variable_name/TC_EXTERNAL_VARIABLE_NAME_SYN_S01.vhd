-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_S01
-- Rule Type: Syntax
-- BNF Production: EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive (Production-Specific)
-- Test Focus: External variable name with relative pathname:
--   <<variable ^.^.driver_inst.retry_count : integer>> uses upward references
--   to access a driver retry counter variable from two levels up.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ext_var_rel_retry is
  port(
    max_retries : in  integer;
    exhausted   : out bit
  );
end entity ext_var_rel_retry;

architecture vhdl2008 of ext_var_rel_retry is
  -- External variable name with two-level upward relative pathname
  alias driver_retries is
    <<variable ^.^.driver_inst.retry_count : integer>>;

begin
  -- Compare local threshold against remote retry count
  exhausted <= '1' when driver_retries >= max_retries else '0';
end architecture vhdl2008;
