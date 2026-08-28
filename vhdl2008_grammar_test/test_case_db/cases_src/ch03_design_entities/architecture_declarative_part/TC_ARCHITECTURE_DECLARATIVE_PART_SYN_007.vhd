-- =============================================================
-- Case ID: TC_ARCHITECTURE_DECLARATIVE_PART_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_declarative_part ::= { block_declarative_item }
-- Case Type: Positive
-- Test Focus: Mixed VHDL 2008 features: declarative part contains protected type declaration + body + shared variable / package instantiation concept / impure function, verifying VHDL 2008 new declarative item categories can coexist with other traditional declarations in the architecture declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity adp_2008_ent is port(clk:in bit; y:out integer); end entity;
architecture bh of adp_2008_ent is
  type t_prot is protected
    procedure set(v:integer); impure function get return integer;
  end protected;
  type t_prot is protected body
    variable v_stored:integer:=0;
    procedure set(v:integer) is begin v_stored:=v; end procedure;
    impure function get return integer is begin return v_stored; end function;
  end protected body;
  shared variable sv_cache:t_prot;
  impure function f_cached(x:integer) return integer is
  begin sv_cache.set(x); return sv_cache.get; end function;
  signal s_val:integer:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then s_val<=f_cached(s_val+1); end if;
  end process;
  y<=s_val;
end architecture bh;
