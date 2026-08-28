-- =============================================================
-- Case ID: TC_INTERFACE_SUBPROGRAM_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_subprogram_declaration ::= interface_subprogram_specification [ is interface_subprogram_default ]
-- Case Type: Positive
-- Test Focus: function specification with 'is' named default (subprogram_name) — full declaration with explicit default function reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

package isdecl_syn1_pkg is
  function my_add ( constant a, b : in integer ) return integer;
end package isdecl_syn1_pkg;

package body isdecl_syn1_pkg is
  function my_add ( constant a, b : in integer ) return integer is
  begin
    return a + b;
  end function;
end package body isdecl_syn1_pkg;

use work.isdecl_syn1_pkg.all;

entity isdecl_syn1 is
  generic (
    function add ( constant a, b : in integer ) return integer is my_add
  );
  port (
    x, y : in  integer;
    sum  : out integer
  );
end entity isdecl_syn1;

architecture bh of isdecl_syn1 is
begin
  sum <= add(x, y);
end architecture bh;
