-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DEFINITION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: PROTECTED_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Test Focus: Production-specific: full protected type definition
--   composed of both declaration and body. Declaration includes
--   subprogram declarations with attribute_specification.
--   Body includes variable, constant, subtype, and method
--   implementations. Tests the complete alternation grammar
--   where both declaration and body are referenced.
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_def_syn_s01 is
  port (
    wr      : in  bit;
    rd      : out bit_vector(15 downto 0)
  );
end entity pt_def_syn_s01;

architecture rtl of pt_def_syn_s01 is
  attribute ram_style : string;
  subtype t_word16 is bit_vector(15 downto 0);
  type t_dual_port is protected
    procedure write_word(addr : natural; d : bit_vector(15 downto 0));
    impure function read_word(addr : natural) return t_word16;
    attribute ram_style of write_word : procedure is "block";
  end protected;
  type t_dual_port is protected body
    constant C_DEPTH : natural := 16;
    subtype t_addr is natural range 0 to C_DEPTH - 1;
    type t_mem is array(t_addr) of bit_vector(15 downto 0);
    variable v_ram : t_mem := (others => (others => '0'));
    procedure write_word(addr : natural; d : bit_vector(15 downto 0)) is
    begin
      v_ram(addr mod C_DEPTH) := d;
    end procedure;
    impure function read_word(addr : natural) return t_word16 is
    begin
      return v_ram(addr mod C_DEPTH);
    end function;
  end protected body;
  shared variable sv : t_dual_port;
begin
  process(wr)
  begin
    if wr'event and wr = '1' then
      sv.write_word(0, X"ABCD");
      sv.write_word(1, X"1234");
      rd <= sv.read_word(0);
    end if;
  end process;
end architecture rtl;
