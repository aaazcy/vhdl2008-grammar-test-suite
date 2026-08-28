-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DEFAULT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DEFAULT
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_default ::= subprogram_name | <>
-- Case Type: Positive
-- Test Focus: default as subprogram_name — a named function reference as the default
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package isdef_syn1_pkg is
  function int_eq ( constant a, b : in integer ) return boolean;
end package isdef_syn1_pkg;

package body isdef_syn1_pkg is
  function int_eq ( constant a, b : in integer ) return boolean is
  begin
    return a = b;
  end function;
end package body isdef_syn1_pkg;

use work.isdef_syn1_pkg.all;

entity isdef_syn1 is
  generic (
    function compare ( constant a, b : in integer ) return boolean is int_eq
  );
  port (
    x, y : in  integer;
    eq   : out boolean
  );
end entity isdef_syn1;

architecture bh of isdef_syn1 is
begin
  eq <= compare(x, y);
end architecture bh;
