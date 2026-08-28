-- =============================================================
-- Case ID: TC_FUNCTION_SPECIFICATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: function_specification ::= [ pure | impure ] function designator subprogram_header [ [ parameter ] ( formal_parameter_list ) ] return type_mark ;
-- Case Type: Positive
-- Test Focus: impure function (accesses external state)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package fsp_pkg2 is
  impure function f_call_count return integer;
end package;
package body fsp_pkg2 is
  type t_pt is protected
    procedure incr;
    impure function get return integer;
  end protected t_pt;
  type t_pt is protected body
    variable v_cnt : integer := 0;
    procedure incr is
    begin
      v_cnt := v_cnt + 1;
    end procedure;
    impure function get return integer is
    begin
      return v_cnt;
    end function;
  end protected body t_pt;
  shared variable sv_count : t_pt;
  impure function f_call_count return integer is
  begin
    sv_count.incr;
    return sv_count.get;
  end function;
end package body;
