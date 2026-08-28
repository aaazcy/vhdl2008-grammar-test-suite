-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part with shared variable + use_clause: verification of shared variable and use clause as package declarative items in a high-density scenario
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sv_dp is
  type t_guard is (off, on_state);
  type t_pt is protected
    procedure set_mode(v:in t_guard);
    impure function get_mode return t_guard;
  end protected t_pt;
  shared variable sv_mode:t_pt;
end package pkg_sv_dp;
package body pkg_sv_dp is
  type t_pt is protected body
    variable v_mode:t_guard:=off;
    procedure set_mode(v:in t_guard) is begin v_mode:=v; end procedure;
    impure function get_mode return t_guard is begin return v_mode; end function;
  end protected body t_pt;
end package body pkg_sv_dp;
entity pdp_sv_ent is port(r:out integer); end entity;
architecture bh of pdp_sv_ent is begin r<=0; end architecture bh;
