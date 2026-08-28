-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Positive
-- Test Focus: default as box notation <> — the open-box placeholder indicating the mapping is deferred
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity isdef_syn3 is
  generic (
    function invert ( constant x : in integer ) return integer is <>
  );
  port (
    a  : in  integer;
    na : out integer
  );
end entity isdef_syn3;

architecture bh of isdef_syn3 is
begin
  na <= invert(a);
end architecture bh;
