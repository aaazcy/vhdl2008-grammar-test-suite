-- =============================================================
-- Case ID: TC_SUBPROGRAM_BODY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_body ::= subprogram_specification is subprogram_declarative_part begin subprogram_statement_part end [ subprogram_kind ] [ designator ] ;
-- Case Type: Positive
-- Test Focus: procedure body with type/subtype/constant/alias combination in declaration region: integer subtype + constant + alias declared in subprogram_declarative_part, subprogram_statement_part uses declaration items to drive ports, verification that subprogram_body can contain multiple declaration items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sb_proc_decl_ent is port(a:in integer; lo,hi:in integer; y:out integer); end entity;
architecture bh of sb_proc_decl_ent is
  procedure p_clip(signal inp:in integer; signal lw,up:in integer; signal outp:out integer) is
    subtype t_val is integer range -32768 to 32767;
    constant C_CLIP_LO:t_val:=t_val(lw);
    constant C_CLIP_HI:t_val:=t_val(up);
    variable v_val:t_val;
  begin
    v_val:=t_val(inp);
    if v_val<C_CLIP_LO then v_val:=C_CLIP_LO; elsif v_val>C_CLIP_HI then v_val:=C_CLIP_HI; end if;
    outp<=integer(v_val);
  end procedure p_clip;
begin
  p_clip(a,lo,hi,y);
end architecture bh;
