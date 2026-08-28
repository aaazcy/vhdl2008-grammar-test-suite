-- =============================================================
-- Case ID: TC_GENERIC_LIST_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Case Type: Positive
-- Test Focus: Exercises generic_list with mixed types: integer range, boolean, and bit_vector generics in a priority encoder.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_list_priority_enc is
  generic (
    INPUT_WIDTH  : integer := 8;
    LS_PRIORITY  : boolean := false;
    DEFAULT_VAL  : bit_vector(3 downto 0) := "0000"
  );
  port (
    input_vec  : in  bit_vector(INPUT_WIDTH-1 downto 0);
    output_idx : out integer range 0 to INPUT_WIDTH-1;
    valid      : out bit
  );
end entity generic_list_priority_enc;

architecture rtl of generic_list_priority_enc is
begin
  process(input_vec)
    variable v_found : boolean;
  begin
    v_found := false;
    valid <= '0';
    if LS_PRIORITY then
      for i in 0 to INPUT_WIDTH-1 loop
        if input_vec(i) = '1' and not v_found then
          output_idx <= i;
          valid <= '1';
          v_found := true;
        end if;
      end loop;
    else
      for i in INPUT_WIDTH-1 downto 0 loop
        if input_vec(i) = '1' and not v_found then
          output_idx <= i;
          valid <= '1';
          v_found := true;
        end if;
      end loop;
    end if;
  end process;
end architecture rtl;
