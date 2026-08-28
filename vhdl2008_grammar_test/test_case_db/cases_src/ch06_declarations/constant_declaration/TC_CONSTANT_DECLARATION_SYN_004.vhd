-- =============================================================
-- Case ID: TC_CONSTANT_DECLARATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.1
-- Production: constant_declaration ::= constant identifier_list : subtype_indication [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises constant_declaration with identifier_list declaring multiple constants sharing the same type and value.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity constant_decl_syn4 is
  port (
    clk : in bit;
    val : out integer
  );
end entity constant_decl_syn4;

architecture rtl of constant_decl_syn4 is
  constant C_WIDTH, C_HEIGHT, C_DEPTH : integer := 16;
  constant C_BASE_ADDR, C_END_ADDR : bit_vector(7 downto 0) := X"00";
  signal s_count : integer range 0 to C_WIDTH := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if s_count < C_WIDTH then
        s_count <= s_count + 1;
      else
        s_count <= 0;
      end if;
    end if;
  end process;
  val <= s_count + C_HEIGHT + C_DEPTH;
end architecture rtl;
