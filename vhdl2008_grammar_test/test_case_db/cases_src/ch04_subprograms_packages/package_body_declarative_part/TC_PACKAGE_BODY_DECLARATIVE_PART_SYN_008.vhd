-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with five body items type+subtype+constant+variable+function body high-density repetition, verification of {item} repeated five times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_dense_body is
  type t_base is range 0 to 1000;
  function f_avg(a,b:t_base) return t_base;
end package pkg_dense_body;
package body pkg_dense_body is
  type t_local is range 0 to 500;
  subtype t_half is t_local range 0 to 250;
  constant C_LO:t_half:=0;
  type t_pt is protected
    procedure set_id(v:in integer);
    impure function get_id return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_id:integer:=0;
    procedure set_id(v:in integer) is begin v_id:=v; end procedure;
    impure function get_id return integer is begin return v_id; end function;
  end protected body t_pt;
  shared variable sv_acc:t_pt;
  function f_avg(a,b:t_base) return t_base is begin return (a+b)/2; end function;
end package body pkg_dense_body;
entity pbdp_dense_ent is port(a,b:in integer; y:out integer); end entity;
architecture bh of pbdp_dense_ent is begin y<=integer(work.pkg_dense_body.f_avg(work.pkg_dense_body.t_base(a),work.pkg_dense_body.t_base(b))); end architecture bh;
