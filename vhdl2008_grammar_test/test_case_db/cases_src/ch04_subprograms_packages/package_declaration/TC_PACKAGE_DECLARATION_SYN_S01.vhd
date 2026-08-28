-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declaration ::= package identifier is package_header package_declarative_part end [ package ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package with types, constants, functions, procedures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_spc is
  constant C_VERSION : string := "1.0";
  type t_state is (INIT, RUN, STOP);
  type t_config is record w:integer; en:boolean; end record;
  function f_init return t_config;
  procedure p_reset(signal s:out t_state);
end package;
package body pkg_spc is
  function f_init return t_config is begin return (w=>8, en=>true); end;
  procedure p_reset(signal s:out t_state) is begin s<=INIT; end;
end package body;
