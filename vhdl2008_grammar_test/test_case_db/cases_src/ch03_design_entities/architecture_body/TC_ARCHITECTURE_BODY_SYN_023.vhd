-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_023
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Mixed VHDL 2008 features: declarative part contains protected type declaration + body + shared variable and an impure function, statement part contains a matching case? statement (VHDL 2008), verifying the architecture can mix multiple VHDL 2008 new syntax elements (protected type, shared var, case? matching statement)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_2008mix_ent is
  port(op:in integer range 0 to 3; a,b:in integer; y:out integer);
end entity;
architecture vhdl2008mix of arch_2008mix_ent is
  type t_prot is protected
    procedure set(v:integer);
    impure function get return integer;
  end protected;
  type t_prot is protected body
    variable v_stored:integer:=0;
    procedure set(v:integer) is begin v_stored:=v; end procedure;
    impure function get return integer is begin return v_stored; end function;
  end protected body;
  shared variable sv_cache:t_prot;
  impure function f_cached(x:integer) return integer is
  begin
    sv_cache.set(x); return sv_cache.get;
  end function;
  signal s_a,s_b,s_y:integer:=0;
begin
  s_a<=a; s_b<=b;
  process(op,s_a,s_b)
  begin
    case? op is
      when 0      => s_y<=f_cached(s_a+s_b);
      when 1      => s_y<=f_cached(s_a-s_b);
      when 2      => s_y<=f_cached(s_a*s_b);
      when others => s_y<=0;
    end case?;
  end process;
  y<=s_y;
end architecture vhdl2008mix;
