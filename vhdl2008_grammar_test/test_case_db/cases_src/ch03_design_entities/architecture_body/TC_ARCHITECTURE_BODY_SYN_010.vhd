-- =============================================================
-- Case ID: TC_ARCHITECTURE_BODY_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_BODY
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_body ::= architecture identifier of entity_name is architecture_declarative_part begin architecture_statement_part end [ architecture ] [ architecture_simple_name ] ;
-- Case Type: Positive
-- Test Focus: comprehensive: all declarative items + all concurrent statements combined
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity arch_full_ent is
  generic(W:integer:=8; D:integer:=16);
  port(clk,rst_n:in bit; din:in bit_vector(W-1 downto 0); addr:in integer range 0 to D-1; wen:in bit; dout:out bit_vector(W-1 downto 0));
end entity;
architecture comprehensive of arch_full_ent is
  type t_state is (IDLE,READ,WRITE,DONE);
  type t_mem is array(0 to D-1) of bit_vector(W-1 downto 0);
  subtype t_word is bit_vector(W-1 downto 0);
  constant C_ZERO:t_word:=(others=>'0');
  signal s_mem:t_mem:=(others=>(others=>'0'));
  signal s_state:t_state:=IDLE;
  signal s_data:t_word:=C_ZERO;
  function f_idx(a:integer) return integer is begin if a<D then return a; else return 0; end if; end function;
  attribute attr_style:string;
  attribute attr_style of comprehensive:architecture is "pipeline";
begin
  b_mem:block
    signal s_wa:integer range 0 to D-1:=0;
  begin
    s_wa<=f_idx(addr);
    process(clk)
    begin
      if clk'event and clk='1' then
        if wen='1' then s_mem(s_wa)<=din; end if;
        s_data<=s_mem(addr);
      end if;
    end process;
  end block b_mem;
  p_fsm:process(clk,rst_n)
  begin
    if rst_n='0' then s_state<=IDLE;
    elsif clk'event and clk='1' then
      case s_state is
        when IDLE=>if wen='1' then s_state<=WRITE; else s_state<=READ; end if;
        when READ=>s_state<=DONE;
        when WRITE=>s_state<=DONE;
        when DONE=>s_state<=IDLE;
      end case;
    end if;
  end process p_fsm;
  gen_out:for i in 0 to W-1 generate dout(i)<=s_data(i); end generate;
  assert D>0 report "DEPTH must be positive" severity failure;
end architecture comprehensive;
