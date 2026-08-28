-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_ITEM_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_BODY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: combinational mixture of
--   body declarative items — variable_declaration,
--   constant_declaration, subtype_declaration, and two
--   subprogram_body items all within one protected body.
--   Exercises the variety of the alternation grammar.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_di_syn_s01 is
  port (
    clk   : in  bit;
    rdata : out bit_vector(3 downto 0)
  );
end entity pt_body_di_syn_s01;

architecture rtl of pt_body_di_syn_s01 is
  subtype t_lfsr_word is bit_vector(3 downto 0);
  type t_lfsr is protected
    procedure seed(s : bit_vector(3 downto 0));
    impure function next_val return t_lfsr_word;
  end protected;
  type t_lfsr is protected body
    constant C_POLY : bit_vector(3 downto 0) := "1001";
    subtype t_state is bit_vector(3 downto 0);
    variable v_sr : t_state := "0001";
    procedure seed(s : bit_vector(3 downto 0)) is
    begin
      if s /= "0000" then v_sr := s; end if;
    end procedure;
    impure function next_val return t_lfsr_word is
      variable fb : bit;
    begin
      fb := v_sr(3) xor v_sr(2);
      v_sr := v_sr(2 downto 0) & fb;
      if v_sr(0) = '1' then
        v_sr := v_sr xor C_POLY;
      end if;
      return v_sr;
    end function;
  end protected body;
  shared variable sv : t_lfsr;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      rdata <= sv.next_val;
    end if;
  end process;
end architecture rtl;
