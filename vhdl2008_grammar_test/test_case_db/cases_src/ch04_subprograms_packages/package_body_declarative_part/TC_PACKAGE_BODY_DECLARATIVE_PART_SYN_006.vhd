-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with repetition of type+constant+function body: three body declarative items appear consecutively, verification of {item} repeated three times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_multi_body is
  type t_data is range 0 to 15;
  constant C_ZERO:t_data:=0;
  function f_next(v:t_data) return t_data;
end package pkg_multi_body;
package body pkg_multi_body is
  type t_local is range -128 to 127;
  constant C_OFFSET:t_local:=1;
  function f_next(v:t_data) return t_data is begin return v+1; end function;
end package body pkg_multi_body;
entity pbdp_multi_ent is port(r:out work.pkg_multi_body.t_data); end entity;
architecture bh of pbdp_multi_ent is begin r<=work.pkg_multi_body.C_ZERO; end architecture bh;
