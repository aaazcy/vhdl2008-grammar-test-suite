-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATIVE_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: subprogram_declarative_part ::= { subprogram_declarative_item }
-- Case Type: Positive
-- Test Focus: subprogram_declarative_part with type+subtype+constant+variable four-item repetition: subtype/constant/variable sequence declared in function, verification of {item} repeated four times
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sdp_multi_ent is port(inp:in integer; outv:out integer); end entity;
architecture bh of sdp_multi_ent is
  function f_process(x:integer) return integer is
    type t_range is range -100 to 100;
    subtype t_small is t_range range -50 to 50;
    constant C_OFF:t_small:=0;
    variable v_val:t_small;
  begin
    v_val:=t_small(x);
    if v_val<C_OFF then v_val:=C_OFF; end if;
    return integer(v_val);
  end function;
begin
  outv<=f_process(inp);
end architecture bh;
