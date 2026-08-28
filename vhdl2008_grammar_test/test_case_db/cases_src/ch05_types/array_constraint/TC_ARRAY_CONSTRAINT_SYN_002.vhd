-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive
-- Test Focus: Descending index constraint on multi-dimensional unconstrained array — exercises downto direction with 2D array subtype constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity array_ctr_2d_descending is
  port(
    row_addr  : in  natural;
    col_addr  : in  natural;
    pixel_val : out bit_vector(7 downto 0)
  );
end entity;

architecture framebuf_access of array_ctr_2d_descending is
  type t_framebuf is array (natural range <>, natural range <>) of bit_vector(7 downto 0);
  subtype t_vga_buf is t_framebuf(479 downto 0, 639 downto 0);
  signal fb : t_vga_buf := (others => (others => x"00"));
begin
  gen_init_rows: for r in 479 downto 0 generate
    gen_init_cols: for c in 639 downto 0 generate
      fb(r,c) <= x"00";
    end generate;
  end generate;
  pixel_val <= fb(row_addr mod 480, col_addr mod 640);
end architecture;
