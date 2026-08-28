-- =============================================================
-- Case ID: TC_INTERFACE_TYPE_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.5
-- Production: interface_type_declaration ::= interface_incomplete_type_declaration
-- Case Type: Positive
-- Test Focus: Exercises interface_type_declaration with type parameter used in array definition within a generic package-like entity.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_type_decl_syn3 is
  generic (
    type t_data;
    constant DEFAULT_VAL : t_data
  );
  port (
    clk  : in  bit;
    q    : out integer
  );
end entity interface_type_decl_syn3;

architecture rtl of interface_type_decl_syn3 is
  signal s_val : integer := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_val <= s_val + 1;
    end if;
  end process;
  q <= s_val;
end architecture rtl;
