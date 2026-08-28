-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with five declaration items type+subtype+constant+signal+function, verification of high-density {item} repeated five times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_dense_dp is
  type t_data is range 0 to 65535;
  subtype t_byte is t_data range 0 to 255;
  constant C_HALF:t_data:=32767;
  signal s_update:boolean:=false;
  function f_clamp(v:t_data; lo,hi:t_data) return t_data;
end package pkg_dense_dp;
package body pkg_dense_dp is
  function f_clamp(v:t_data; lo,hi:t_data) return t_data is
  begin if v<lo then return lo; elsif v>hi then return hi; else return v; end if; end function;
end package body pkg_dense_dp;
entity pdp_dense_ent is port(v,lo,hi:in work.pkg_dense_dp.t_data; r:out work.pkg_dense_dp.t_data); end entity;
architecture bh of pdp_dense_ent is begin r<=work.pkg_dense_dp.f_clamp(v,lo,hi); end architecture bh;
