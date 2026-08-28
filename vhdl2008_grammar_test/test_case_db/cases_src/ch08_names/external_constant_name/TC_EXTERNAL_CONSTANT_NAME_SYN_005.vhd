-- =============================================================
-- Case ID: TC_EXTERNAL_CONSTANT_NAME_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_CONSTANT_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_constant_name ::= << constant external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: external constant name referencing a package path constant via an alias declaration — alias cfg_thresh is <<constant @lib.pkg.THRESHOLD_VAL : natural>>, and in the process the external constant is used in a condition, verifying the complete syntax chain of alias + external constant name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_const_alias_ref is
  port(sample_val : in natural; exceeds_thresh : out bit);
end entity;

architecture vhdl2008 of ext_const_alias_ref is
  alias cfg_thresh is <<constant @work.params_pkg.THRESHOLD_VAL : natural>>;
begin
  process(sample_val)
  begin
    if sample_val > cfg_thresh then
      exceeds_thresh <= '1';
    else
      exceeds_thresh <= '0';
    end if;
  end process;
end architecture vhdl2008;
