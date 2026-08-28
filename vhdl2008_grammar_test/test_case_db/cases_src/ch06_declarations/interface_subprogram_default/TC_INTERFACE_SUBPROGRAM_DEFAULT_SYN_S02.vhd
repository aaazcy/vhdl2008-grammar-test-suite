-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_subprogram_default with "<>" (box) default indicating no default subprogram.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_subprog_default_syn_s2 is
  port (
    data : in  integer;
    scaled : out integer
  );
end entity interface_subprog_default_syn_s2;

architecture rtl of interface_subprog_default_syn_s2 is
  function scale_val(x : integer) return integer is
  begin
    return x * 2;
  end function;
begin
  scaled <= scale_val(data);
end architecture rtl;
