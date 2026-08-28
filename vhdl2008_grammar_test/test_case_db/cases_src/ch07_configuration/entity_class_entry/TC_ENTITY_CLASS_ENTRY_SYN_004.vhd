-- =============================================================
-- Case ID: TC_ENTITY_CLASS_ENTRY_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_CLASS_ENTRY
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_class_entry ::= entity_class [ <> ]
-- Case Type: Positive
-- Test Focus: Entity class entry with box '<>' across multiple entity_classes in group template — exercises the optional box suffix on different entity_class keywords (signal <>, variable <>, procedure <>, function <>) in a single group template declaration, testing progressive complexity with unconstrained entity classes in a FIFO buffer context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ece_fifo_ctrl is
  port(
    clk      : in  bit;
    wr_en    : in  bit;
    rd_en    : in  bit;
    data_in  : in  bit_vector(15 downto 0);
    data_out : out bit_vector(15 downto 0);
    empty    : out bit;
    full     : out bit
  );
end entity;

architecture rtl of ece_fifo_ctrl is
  -- Group template using entity_class_entry with box on multiple classes
  group unconstrained_path is (signal, signal, signal <>);
  -- Another group with box on procedure and function classes
  group dyn_subprogram is (function, procedure, signal <>);

  type fifo_array is array(0 to 15) of bit_vector(15 downto 0);
  signal fifo_mem  : fifo_array := (others => (others => '0'));
  signal wr_ptr    : integer range 0 to 15 := 0;
  signal rd_ptr    : integer range 0 to 15 := 0;
  signal count     : integer range 0 to 16 := 0;

  function f_incr(p : integer range 0 to 15) return integer is
  begin
    if p = 15 then return 0; else return p + 1; end if;
  end function;

  procedure p_update_count(
    signal cnt : inout integer range 0 to 16;
    wr : in bit;
    rd : in bit
  ) is
  begin
    if wr = '1' and rd = '0' and cnt < 16 then
      cnt <= cnt + 1;
    elsif rd = '1' and wr = '0' and cnt > 0 then
      cnt <= cnt - 1;
    end if;
  end procedure;

  -- Apply group templates
  group u_path : unconstrained_path (fifo_mem, data_out, wr_ptr);
  group d_sub  : dyn_subprogram (f_incr, p_update_count, data_in);
begin
  process(clk)
    variable v_wr, v_rd : integer range 0 to 15 := 0;
  begin
    if clk'event and clk = '1' then
      v_wr := wr_ptr;
      v_rd := rd_ptr;
      if wr_en = '1' and count < 16 then
        fifo_mem(wr_ptr) <= data_in;
        wr_ptr <= f_incr(wr_ptr);
        p_update_count(count, '1', '0');
      end if;
      if rd_en = '1' and count > 0 then
        data_out <= fifo_mem(rd_ptr);
        rd_ptr <= f_incr(rd_ptr);
        p_update_count(count, '0', '1');
      end if;
    end if;
  end process;

  empty <= '1' when count = 0 else '0';
  full  <= '1' when count = 16 else '0';
end architecture rtl;
